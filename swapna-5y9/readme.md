##EXPERIMENT-8-1
-- PROGRAM 1: CURSOR WITH PARAMETERS
-- BANKING SYSTEM
SELECT * FROM ACCOUNT;
SET SERVEROUTPUT ON;
#create table
-- Create ACCOUNT table

CREATE TABLE ACCOUNT
(
    ACCOUNT_NO NUMBER(6) PRIMARY KEY,
    CUSTOMER_NAME VARCHAR2(30),
    ACCOUNT_TYPE VARCHAR2(20),
    BALANCE NUMBER(10,2)
);

-- Insert sample records

INSERT INTO ACCOUNT VALUES (100001, 'Rahul', 'SAVINGS', 25000);
INSERT INTO ACCOUNT VALUES (100002, 'Sneha', 'CURRENT', 45000);
INSERT INTO ACCOUNT VALUES (100003, 'Arjun', 'SAVINGS', 30000);
INSERT INTO ACCOUNT VALUES (100004, 'Priya', 'CURRENT', 55000);
INSERT INTO ACCOUNT VALUES (100005, 'Kiran', 'SAVINGS', 20000);

COMMIT;
![output](8a1.png)

-- Parameterized Cursor

DECLARE

    CURSOR C_ACCOUNT(P_ACCOUNT_TYPE VARCHAR2) IS
        SELECT ACCOUNT_NO,
               CUSTOMER_NAME,
               ACCOUNT_TYPE,
               BALANCE
        FROM ACCOUNT
        WHERE ACCOUNT_TYPE = P_ACCOUNT_TYPE;

BEGIN

    DBMS_OUTPUT.PUT_LINE('Accounts with SAVINGS Type');
    DBMS_OUTPUT.PUT_LINE('----------------------------');

    FOR REC IN C_ACCOUNT('SAVINGS') LOOP

        DBMS_OUTPUT.PUT_LINE(
            'Account No: ' || REC.ACCOUNT_NO ||
            '  Customer Name: ' || REC.CUSTOMER_NAME ||
            '  Account Type: ' || REC.ACCOUNT_TYPE ||
            '  Balance: ' || REC.BALANCE
        );

    END LOOP;

END;
/

![output](8a2.png)

##EXPERIMENT-8-2


-- PROGRAM 2: CURSOR WITH PARAMETERS
-- HOSPITAL MANAGEMENT

SET SERVEROUTPUT ON;

-- Create PATIENT table

CREATE TABLE PATIENT
(
    PATIENT_ID NUMBER(4) PRIMARY KEY,
    PATIENT_NAME VARCHAR2(30),
    DEPARTMENT VARCHAR2(30),
    DOCTOR_NAME VARCHAR2(30)

-- Insert sample records
INSERT INTO PATIENT VALUES (101, 'Rahul', 'Cardiology', 'Dr. Kumar');
INSERT INTO PATIENT VALUES (102, 'Sneha', 'Neurology', 'Dr. Sharma');
INSERT INTO PATIENT VALUES (103, 'Arjun', 'Cardiology', 'Dr. Reddy');
INSERT INTO PATIENT VALUES (104, 'Priya', 'Orthopedics', 'Dr. Singh');
INSERT INTO PATIENT VALUES (105, 'Kiran', 'Cardiology', 'Dr. Kumar');

COMMIT;
![output](8b1.png)

DECLARE

    CURSOR C_PATIENT(P_DEPARTMENT VARCHAR2) IS
        SELECT PATIENT_ID,
               PATIENT_NAME,
               DEPARTMENT,
               DOCTOR_NAME
        WHERE DEPARTMENT = P_DEPARTMENT;

BEGIN

    DBMS_OUTPUT.PUT_LINE('Patients in Cardiology Department');
    DBMS_OUTPUT.PUT_LINE('-----------------------------------');

    FOR REC IN C_PATIENT('Cardiology') LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Patient ID: ' || REC.PATIENT_ID ||
            '  Patient Name: ' || REC.PATIENT_NAME ||
            '  Department: ' || REC.DEPARTMENT ||
            '  Doctor: ' || REC.DOCTOR_NAME

    END LOOP;

END;
/

![output](8b2.png)

SET SERVEROUTPUT ON;
DROP TABLE EMPLOYEE;
SELECT * FROM EMPLOYEE;


##exp8-3
##create employee
-- Create EMPLOYEE table
CREATE TABLE EMPLOYEE
(
    EMPLOYEE_ID NUMBER(4) PRIMARY KEY,
    EMPLOYEE_NAME VARCHAR2(30),
    DEPARTMENT VARCHAR2(20),
    SALARY NUMBER(10,2)
);

-- Insert sample records
INSERT INTO EMPLOYEE VALUES (101, 'Rahul', 'HR', 35000);
INSERT INTO EMPLOYEE VALUES (102, 'Sneha', 'Sales', 42000);
INSERT INTO EMPLOYEE VALUES (104, 'Priya', 'Finance', 45000);
INSERT INTO EMPLOYEE VALUES (105, 'Kiran', 'Sales', 39000);

COMMIT;
![output](8c1.png)
-- FOR UPDATE cursor
DECLARE
    CURSOR C_EMPLOYEE IS
        SELECT EMPLOYEE_ID,
               EMPLOYEE_NAME,
               DEPARTMENT,
               SALARY
        FROM EMPLOYEE
        FOR UPDATE;

BEGIN
    FOR REC IN C_EMPLOYEE LOOP
        -- Increase salary by 10%
        UPDATE EMPLOYEE
        SET SALARY = SALARY * 1.10
        WHERE CURRENT OF C_EMPLOYEE;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Salary increased by 10% for all employees.');
    DBMS_OUTPUT.PUT_LINE('Records updated successfully.');

END;
/
-- Display updated table
       EMPLOYEE_NAME,
       DEPARTMENT,
       SALARY
FROM EMPLOYEE;
![output](8c2.png)


##experiment-8-4
SET SERVEROUTPUT ON;
-- Create BOOK table
CREATE TABLE BOOK
(
    BOOK_ID NUMBER(4) PRIMARY KEY,
    BOOK_TITLE VARCHAR2(50),
    AUTHOR VARCHAR2(30),
);

-- Insert sample book records
INSERT INTO BOOK VALUES (101, 'Database Management System', 'Korth', 10);
INSERT INTO BOOK VALUES (102, 'Operating System', 'Galvin', 8);
INSERT INTO BOOK VALUES (103, 'Computer Networks', 'Tanenbaum', 12);
INSERT INTO BOOK VALUES (104, 'Python Programming', 'Guido', 15);

COMMIT;

-- FOR UPDATE Cursor

SELECT BOOK_ID,
       BOOK_TITLE,
       AUTHOR,
       AVAILABLE_COPIES
FROM BOOK;DECLARE
    CURSOR C_BOOK IS
               BOOK_TITLE,
               AUTHOR,
               AVAILABLE_COPIES
        FROM BOOK
        FOR UPDATE;

BEGIN
    FOR REC IN C_BOOK LOOP
        -- Increase available copies by 5
        UPDATE BOOK
        SET AVAILABLE_COPIES = AVAILABLE_COPIES + 5
        WHERE CURRENT OF C_BOOK;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Available copies increased by 5 for all books.');

END;
/

-- Display updated BOOK table
Display updated BOOK table
       BOOK_TITLE,
       AUTHOR,
       AVAILABLE_COPIES
FROM BOOK;
![output](8c4.png)
![output](8c5.png)

##experiment 8-5
SET SERVEROUTPUT ON;

-- Create PRODUCT table
(
    PRODUCT_ID NUMBER(4) PRIMARY KEY,
    PRODUCT_NAME VARCHAR2(30),
    PRICE NUMBER(10,2),
    QUANTITY NUMBER(5)
);
-- Insert sample product records
INSERT INTO PRODUCT VALUES (101, 'Laptop', 50000, 10);
INSERT INTO PRODUCT VALUES (102, 'Mobile Phone', 20000, 25);
INSERT INTO PRODUCT VALUES (104, 'Keyboard', 1500, 30);
INSERT INTO PRODUCT VALUES (105, 'Mouse', 800, 50);

COMMIT;
-- FOR UPDATE Cursor
DECLARE
    CURSOR C_PRODUCT IS
               PRODUCT_NAME,
               QUANTITY
        FROM PRODUCT

BEGIN
    FOR REC IN C_PRODUCT LOOP

        UPDATE PRODUCT
        SET PRICE = PRICE * 1.05
        WHERE CURRENT OF C_PRODUCT;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Product price increased by 5% for all products.');
    DBMS_OUTPUT.PUT_LINE('Records updated successfully.');

END;
/

-- Display updated PRODUCT table
        -- Increase product price by 5%
        FOR UPDATE;
    V_BRANCH           STUDENT.BRANCH%TYPE;
    DBMS_OUTPUT.PUT_LINE('Students in CSE Branch');
    DBMS_OUTPUT.PUT_LINE('----------------------');

    -- Open REF CURSOR for CSE students
    OPEN C_REF FOR
        SELECT STUDENT_ID,
               STUDENT_NAME,
               BRANCH,
               SEMESTER,
               CGPA
        FROM STUDENT
BEGIN

    V_SEMESTER         STUDENT.SEMESTER%TYPE;
    V_CGPA             STUDENT.CGPA%TYPE;

               PRICE,
        SELECT PRODUCT_ID,
    V_STUDENT_NAME     STUDENT.STUDENT_NAME%TYPE;

INSERT INTO PRODUCT VALUES (103, 'Headphones', 2000, 40);
    C_REF REF_STUDENT_CURSOR;

    V_STUDENT_ID       STUDENT.STUDENT_ID%TYPE;
SELECT PRODUCT_ID,
       PRODUCT_NAME,
       PRICE,
       QUANTITY
FROM PRODUCT;
    TYPE REF_STUDENT_CURSOR IS REF CURSOR;

![output](8-5.png)

##experiment8-6

SET SERVEROUTPUT ON;
-- Create STUDENT table
(
    STUDENT_ID NUMBER(4) PRIMARY KEY,

    -- REF CURSOR declaration
    STUDENT_NAME VARCHAR2(30),
        WHERE BRANCH = 'CSE';

    -- Fetch and display using REF CURSOR
        );
    END LOOP;
    -- Close REF CURSOR
    CLOSE C_REF;

    DBMS_OUTPUT.PUT_LINE('----------------------');

    FOR REC IN C_UPDATE('CSE') LOOP

        -- Check CGPA
        IF REC.CGPA >= 9.0 THEN

            -- Update scholarship status
            UPDATE STUDENT
            SET SCHOLARSHIP_STATUS = 'Eligible'
            WHERE CURRENT OF C_UPDATE;

            DBMS_OUTPUT.PUT_LINE(
                'Scholarship Eligible: Student ID ' ||
                REC.STUDENT_ID
            );

        END IF;

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('----------------------');
    DBMS_OUTPUT.PUT_LINE('Scholarship status updated successfully.');

END;
/
![output](8-6.png) 
-- Display final updated table
SELECT STUDENT_ID,
       STUDENT_NAME,
       BRANCH,
       SEMESTER,
       CGPA,
       SCHOLARSHIP_STATUS

##experiment 8-7
create table
FROM STUDENT; 
   -- FOR UPDATE cursor using parameterized branch

            '  Semester: ' || V_SEMESTER ||
            '  CGPA: ' || V_CGPA
            'Student ID: ' || V_STUDENT_ID ||
            '  Name: ' || V_STUDENT_NAME ||
            '  Branch: ' || V_BRANCH ||

        EXIT WHEN C_REF%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
    LOOP
        FETCH C_REF
             V_BRANCH,
             V_SEMESTER,
             V_CGPA;
        INTO V_STUDENT_ID,
             V_STUDENT_NAME,
    COURSE VARCHAR2(30),
    MARKS NUMBER(3)
);
        FROM STUDENT
        WHERE BRANCH = P_BRANCH
        FOR UPDATE;
INSERT INTO STUDENT VALUES (102, 'Sneha', 'B.Tech ECE', 78);
INSERT INTO STUDENT VALUES (103, 'Arjun', 'B.Tech CSE', 92);
INSERT INTO STUDENT VALUES (104, 'Priya', 'B.Tech IT', 88);


-- REF CURSOR
               CGPA,
               SCHOLARSHIP_STATUS
DECLARE
    TYPE STUDENT_CURSOR IS REF CURSOR;
    C_STUDENT STUDENT_CURSOR;

    V_STUDENT_ID   STUDENT.STUDENT_ID%TYPE;
    -- FOR UPDATE cursor
    CURSOR C_UPDATE(P_BRANCH VARCHAR2) IS
        SELECT STUDENT_ID,
    V_STUDENT_NAME STUDENT.STUDENT_NAME%TYPE;
    V_COURSE       STUDENT.COURSE%TYPE;
    V_MARKS        STUDENT.MARKS%TYPE;

BEGIN
    -- Open REF CURSOR
    OPEN C_STUDENT FOR
        SELECT STUDENT_ID,

               STUDENT_NAME,
               COURSE,
               MARKS
        FROM STUDENT;
               SEMESTER,
               CGPA
        FROM STUDENT
        WHERE BRANCH = P_BRANCH;

    -- Fetch and display records
    LOOP
        FETCH C_STUDENT
        INTO V_STUDENT_ID,
             V_STUDENT_NAME,
             V_COURSE,
               STUDENT_NAME,
               BRANCH,
             V_MARKS;

        EXIT WHEN C_STUDENT%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
    -- Parameterized cursor for specified branch
    CURSOR C_STUDENT(P_BRANCH VARCHAR2) IS
        SELECT STUDENT_ID,
            'Student ID: ' || V_STUDENT_ID ||
/

![output](8-7.png)

##experiment8

    EXPERIENCE NUMBER(2)
INSERT INTO DOCTOR VALUES (101, 'Dr. Kumar', 'Cardiology', 12);
INSERT INTO DOCTOR VALUES (103, 'Dr. Reddy', 'Orthopedics', 15);

            'Doctor ID: ' || V_DOCTOR_ID ||
            '  Name: ' || V_DOCTOR_NAME ||
    PRODUCT_NAME VARCHAR2(30),
INSERT INTO STUDENT VALUES (105, 'Kiran', 'CSE', 4, 7.80, 'Not Eligible');

COMMIT;

DECLARE
);
INSERT INTO ORDERS VALUES (105, 'Kiran', 'Smart Watch', 2, 10000);

-- REF CURSOR
DECLARE

    V_ORDER_ID      ORDERS.ORDER_ID%TYPE;
INSERT INTO STUDENT VALUES (104, 'Priya', 'ECE', 4, 9.10, 'Not Eligible');
    V_QUANTITY      ORDERS.QUANTITY%TYPE;

BEGIN
    -- Open REF CURSOR
    OPEN C_ORDER FOR
        SELECT ORDER_ID,
INSERT INTO STUDENT VALUES (103, 'Arjun', 'CSE', 4, 9.50, 'Not Eligible');
               CUSTOMER_NAME,
               PRODUCT_NAME,
               QUANTITY,
               TOTAL_AMOUNT
        FROM ORDERS;

INSERT INTO STUDENT VALUES (101, 'Rahul', 'CSE', 4, 9.20, 'Not Eligible');
INSERT INTO STUDENT VALUES (102, 'Sneha', 'CSE', 4, 8.60, 'Not Eligible');
    V_TOTAL_AMOUNT  ORDERS.TOTAL_AMOUNT%TYPE;
    V_PRODUCT_NAME  ORDERS.PRODUCT_NAME%TYPE;
    V_CUSTOMER_NAME ORDERS.CUSTOMER_NAME%TYPE;
    C_ORDER ORDER_CURSOR;
    SCHOLARSHIP_STATUS VARCHAR2(20)
);
-- Insert sample student records
    TYPE ORDER_CURSOR IS REF CURSOR;
COMMIT;

INSERT INTO ORDERS VALUES (101, 'Rahul', 'Laptop', 1, 55000);
INSERT INTO ORDERS VALUES (104, 'Priya', 'Keyboard', 1, 1500);
    SEMESTER NUMBER(2),
    CGPA NUMBER(3,2),
INSERT INTO ORDERS VALUES (102, 'Sneha', 'Mobile Phone', 2, 40000);
    -- Fetch and display records
    LOOP
    STUDENT_ID NUMBER(4) PRIMARY KEY,
    STUDENT_NAME VARCHAR2(30),
    BRANCH VARCHAR2(20),
        FETCH C_ORDER
        INTO V_ORDER_ID,
             V_CUSTOMER_NAME,
             V_PRODUCT_NAME,
CREATE TABLE STUDENT
(
             V_TOTAL_AMOUNT;
            'Order ID: ' || V_ORDER_ID ||
            '  Quantity: ' || V_QUANTITY ||

-- Create STUDENT table
            '  Total Amount: ' || V_TOTAL_AMOUNT
    END LOOP;

    -- Close REF CURSOR
    CLOSE C_ORDER;
SET SERVEROUTPUT ON;


END;
![output](8-7.png)

##EXPERIMENT 8-8
/
       EMPLOYEE_NAME,
       DEPARTMENT,
       SALARY,
       EXPERIENCE
FROM EMPLOYEE;

SET SERVEROUTPUT ON;
-- Display updated EMPLOYEE table
SELECT EMPLOYEE_ID,

-- Create EMPLOYEE table
CREATE TABLE EMPLOYEE(
/

    EMPLOYEE_ID NUMBER(4) PRIMARY KEY,
    EMPLOYEE_NAME VARCHAR2(30),
    DEPARTMENT VARCHAR2(20),
    SALARY NUMBER(10,2),
END;
    EXPERIENCE NUMBER(2)
);
    DBMS_OUTPUT.PUT_LINE('--------------------------');
    DBMS_OUTPUT.PUT_LINE('Salary updated successfully.');

-- Insert sample records
INSERT INTO EMPLOYEE VALUES (101, 'Rahul', 'HR', 35000, 5);
INSERT INTO EMPLOYEE VALUES (102, 'Sneha', 'Sales', 42000, 4);

INSERT INTO EMPLOYEE VALUES (103, 'Arjun', 'HR', 38000, 6);
INSERT INTO EMPLOYEE VALUES (104, 'Priya', 'Finance', 45000, 7);
    END LOOP;

    COMMIT;
            '  Experience: ' || REC.EXPERIENCE || ' years'
        );

INSERT INTO EMPLOYEE VALUES (105, 'Kiran', 'Sales', 39000, 3);

            '  Updated Salary: ' || V_NEW_SALARY ||
COMMIT;
        DBMS_OUTPUT.PUT_LINE(
            'Employee ID: ' || REC.EMPLOYEE_ID ||
            '  Name: ' || REC.EMPLOYEE_NAME ||


        -- Display updated details
        UPDATE EMPLOYEE
        SET SALARY = V_NEW_SALARY
        WHERE CURRENT OF C_EMPLOYEE;
-- Parameterized FOR UPDATE Cursor
DECLARE

    CURSOR C_EMPLOYEE(P_DEPT VARCHAR2) IS
        SELECT EMPLOYEE_ID,
        -- Increase salary by Rs. 3000
        V_NEW_SALARY := REC.SALARY + 3000;
               EMPLOYEE_NAME,
    FOR REC IN C_EMPLOYEE('HR') LOOP

               DEPARTMENT,
               SALARY,
               EXPERIENCE
        FROM EMPLOYEE
        WHERE DEPARTMENT = P_DEPT
        FOR UPDATE;

    V_NEW_SALARY NUMBER(10,2);

BEGIN
    DBMS_OUTPUT.PUT_LINE('Employees in HR Department');
    DBMS_OUTPUT.PUT_LINE('--------------------------');

    -- Open cursor for HR department
    DBMS_OUTPUT.PUT_LINE('All order records displayed successfully.');
        );
            '  Customer: ' || V_CUSTOMER_NAME ||
            '  Product: ' || V_PRODUCT_NAME ||

        DBMS_OUTPUT.PUT_LINE(
        EXIT WHEN C_ORDER%NOTFOUND;

             V_QUANTITY,
INSERT INTO ORDERS VALUES (103, 'Arjun', 'Headphones', 3, 6000);

-- Insert sample order records
    QUANTITY NUMBER(4),
    TOTAL_AMOUNT NUMBER(10,2)
    ORDER_ID NUMBER(4) PRIMARY KEY,
    CUSTOMER_NAME VARCHAR2(30),
![output](8-9.png)
![output](8-8.png)
##experiment8-10
SET SERVEROUTPUT ON;



    DBMS_OUTPUT.PUT_LINE('All doctor records displayed successfully.');
/


END;
    -- Close REF CURSOR
    CLOSE C_DOCTOR;
        );
    END LOOP;
            '  Specialization: ' || V_SPECIALIZATION ||
            '  Experience: ' || V_EXPERIENCE || ' years'
INSERT INTO DOCTOR VALUES (104, 'Dr. Singh', 'Dermatology', 8);
        DBMS_OUTPUT.PUT_LINE(



        EXIT WHEN C_DOCTOR%NOTFOUND;
             V_SPECIALIZATION,
             V_EXPERIENCE;
        INTO V_DOCTOR_ID,
             V_DOCTOR_NAME,
               DOCTOR_NAME,
        FETCH C_DOCTOR
    -- Fetch and display records
    LOOP
        FROM DOCTOR;

               SPECIALIZATION,
               EXPERIENCE
    -- Open REF CURSOR
        SELECT DOCTOR_ID,
    OPEN C_DOCTOR FOR
    TYPE DOCTOR_CURSOR IS REF CURSOR;
BEGIN
    V_DOCTOR_NAME     DOCTOR.DOCTOR_NAME%TYPE;

    V_SPECIALIZATION  DOCTOR.SPECIALIZATION%TYPE;
    V_EXPERIENCE      DOCTOR.EXPERIENCE%TYPE;
    V_DOCTOR_ID       DOCTOR.DOCTOR_ID%TYPE;
    C_DOCTOR DOCTOR_CURSOR;

DECLARE
end;
/

![output](8-10.png)
