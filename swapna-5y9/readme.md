##SET SERVEROUTPUT ON;
##exp-3
-- Create EMPLOYEE table
CREATE TABLE EMPLOYEE
(
    EMPLOYEE_ID NUMBER(4) PRIMARY KEY,
    EMPLOYEE_NAME VARCHAR2(30),
    DEPARTMENT VARCHAR2(20),
    SALARY NUMBER(10,2)
);
desc employee;
-- Insert sample records
INSERT INTO EMPLOYEE VALUES (101, 'Rahul', 'HR', 35000);
INSERT INTO EMPLOYEE VALUES (102, 'Sneha', 'Sales', 42000);
INSERT INTO EMPLOYEE VALUES (103, 'Arjun', 'Finance', 45000);

COMMIT;

-- Create BEFORE UPDATE Row-Level Trigger
CREATE OR REPLACE TRIGGER TRG_BEFORE_UPDATE
BEFORE UPDATE
ON EMPLOYEE
FOR EACH ROW
BEGIN
    -- Check if new salary is negative
    IF :NEW.SALARY < 0 THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Salary cannot be negative.'
        );
    END IF;

    -- Check if salary is decreased
    IF :NEW.SALARY < :OLD.SALARY THEN
        RAISE_APPLICATION_ERROR(
            -20002,
            'Salary cannot be decreased.'
        );
    END IF;
END;
/

-- Valid update
BEGIN
    UPDATE EMPLOYEE
    SET SALARY = 40000
    WHERE EMPLOYEE_ID = 101;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE(
        'Valid update completed successfully.'
    );
END;
/

-- Invalid update
BEGIN
    UPDATE EMPLOYEE
    SET SALARY = 30000
    WHERE EMPLOYEE_ID = 102;

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Invalid update rejected: ' || SQLERRM
        );
END;
/

-- Display final table
SELECT EMPLOYEE_ID,
       EMPLOYEE_NAME,
       DEPARTMENT,
       SALARY
FROM EMPLOYEE;

![output](9-c.png)
![output](9-c1.png)


##exp 9-4
SET SERVEROUTPUT ON;
-- Create EMPLOYEE table
CREATE TABLE EMPLOYEE
(
    EMPLOYEE_NAME VARCHAR2(30),
    DEPARTMENT VARCHAR2(20),
    SALARY NUMBER(10,2)

-- Create DELETE LOG table
CREATE TABLE DELETE_LOG
    LOG_ID NUMBER(4),
    MESSAGE VARCHAR2(100)
);

-- Insert sample employee records
INSERT INTO EMPLOYEE VALUES (3, 'Sneha', 'Sales', 42000);
INSERT INTO EMPLOYEE VALUES (6, 'Arjun', 'Finance', 45000);
INSERT INTO EMPLOYEE VALUES (7, 'Priya', 'IT', 40000);
COMMIT;

-- Create AFTER DELETE Statement-Level Trigger
CREATE OR REPLACE TRIGGER TRG_AFTER_DELETE
AFTER DELETE
ON EMPLOYEE
    INSERT INTO DELETE_LOG
    VALUES (1, 'DELETE operation completed successfully.');

    DBMS_OUTPUT.PUT_LINE(
        'DELETE operation completed successfully.'
END;
/

-- Delete multiple employee records
DELETE FROM EMPLOYEE
WHERE EMPLOYEE_ID IN (101, 102);
COMMIT;

-- Display remaining EMPLOYEE records
SELECT *

-- Display DELETE LOG
SELECT *
FROM DELETE_LOG;
![output](9-d.png)
##exp-5
SET SERVEROUTPUT ON;

-- Create base EMPLOYEE table
CREATE TABLE EMPLOYEE
(
    EMPLOYEE_ID NUMBER(4) PRIMARY KEY,
    DEPARTMENT VARCHAR2(20),
    SALARY NUMBER(10,2)
);

-- Insert sample records
INSERT INTO EMPLOYEE VALUES (101, 'Rahul', 'HR', 35000);
INSERT INTO EMPLOYEE VALUES (102, 'Sneha', 'Sales', 42000);
INSERT INTO EMPLOYEE VALUES (103, 'Arjun', 'Finance', 45000);
COMMIT;

-- Create view
CREATE OR REPLACE VIEW EMPLOYEE_VIEW AS
SELECT EMPLOYEE_ID,
       EMPLOYEE_NAME,
       DEPARTMENT,
       SALARY
FROM EMPLOYEE;

CREATE OR REPLACE TRIGGER TRG_UPDATE_VIEW
INSTEAD OF UPDATE
ON EMPLOYEE_VIEW
FOR EACH ROW
BEGIN
    UPDATE EMPLOYEE
    SET EMPLOYEE_NAME = :NEW.EMPLOYEE_NAME,
        DEPARTMENT = :NEW.DEPARTMENT,
        SALARY = :NEW.SALARY
    WHERE EMPLOYEE_ID = :OLD.EMPLOYEE_ID;

    DBMS_OUTPUT.PUT_LINE(
        'Employee record updated through the view.'
END;
/

-- Update employee through the view
UPDATE EMPLOYEE_VIEW
SET SALARY = 40000
WHERE EMPLOYEE_ID = 101;

COMMIT;

-- Display base table
SELECT EMPLOYEE_ID,
       EMPLOYEE_NAME,
       DEPARTMENT,
FROM EMPLOYEE;     
![output](9-e.png)
