##     SELECT * FROM STUDENT1;
DESC STUDENT1;
![output](6a1.png)
#insert values
INSERT INTO STUDENT1 VALUES (101, 'Ayesha', 'CSE', 85);
INSERT INTO STUDENT1 VALUES (102, 'Rahul', 'CSE', 55);
INSERT INTO STUDENT1 VALUES (103, 'Saniya', 'ECE', 72);
INSERT INTO STUDENT1 VALUES (104, 'Anjum', 'EEE', 48);
INSERT INTO STUDENT1 VALUES (105, 'Priya', 'CSE', 91);
![output](6a2.png)
COMMIT;

SET SERVEROUTPUT ON;

DECLARE
    v_id       STUDENT1.SID%TYPE := 101;
    v_name     STUDENT1.SNAME%TYPE;
    v_marks    STUDENT1.DID%TYPE;
    v_grade    VARCHAR2(20);
    v_result   VARCHAR2(20);
    v_value    NUMBER;
BEGIN

    SELECT SNAME, DID
    INTO v_name, v_marks
    FROM STUDENT1
    WHERE SID = v_id;

    IF v_marks >= 90 THEN
        v_grade := 'A+';
    ELSIF v_marks >= 75 THEN
        v_grade := 'A';
    ELSIF v_marks >= 60 THEN
        v_grade := 'B';
    ELSIF v_marks >= 40 THEN
        v_grade := 'C';
    ELSE
        v_grade := 'F';
    END IF;

    IF v_marks >= 40 THEN
        v_result := 'PASS';
    ELSE
        v_result := 'FAIL';
    END IF;

    DBMS_OUTPUT.PUT_LINE('Student ID : ' || v_id);
    DBMS_OUTPUT.PUT_LINE('Student Name : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Marks : ' || v_marks);
    DBMS_OUTPUT.PUT_LINE('Grade : ' || v_grade);
    DBMS_OUTPUT.PUT_LINE('Result : ' || v_result);

END;
/
![output](6a3.png)


SET SERVEROUTPUT ON;

DECLARE
    v_student_id STUDENT.STUDENT_ID%TYPE := 101;
    v_name       STUDENT.STUDENT_NAME%TYPE;
    v_course     STUDENT.COURSE%TYPE;

    v_age_number NUMBER := 20;
    invalid_marks EXCEPTION;
    


BEGIN

    -- 1. WHILE LOOP
    DBMS_OUTPUT.PUT_LINE('1. Numbers using WHILE LOOP:');
    WHILE i <= 5 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
        i := i + 1;
    END LOOP;

    -- 2. NUMERIC FOR LOOP
    DBMS_OUTPUT.PUT_LINE('2. Numbers using FOR LOOP:');

    FOR j IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE(j);


    -- 3. NESTED FOR LOOP
    DBMS_OUTPUT.PUT_LINE('3. Multiplication Table:');

    FOR x IN 1..3 LOOP
        FOR y IN 1..3 LOOP
                x || ' x ' || y || ' = ' || (x * y)
            );
        DBMS_OUTPUT.PUT_LINE('');
    END LOOP;


    -- 4. Retrieve student record
        SELECT STUDENT_NAME, COURSE, MARKS
        INTO v_name, v_course, v_marks
        FROM STUDENT
        WHERE STUDENT_ID = v_student_id;
        DBMS_OUTPUT.PUT_LINE('Student Name: ' || v_name);
        DBMS_OUTPUT.PUT_LINE('Course: ' || v_course);
        DBMS_OUTPUT.PUT_LINE('Marks: ' || v_marks);

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No student record found.');
    END;

    -- 5. Validate marks
    IF v_marks > 100 THEN
        RAISE invalid_marks;
    END IF;

    -- 6. Validate age
    IF v_age < 18 THEN
        RAISE_APPLICATION_ERROR(
            'Age must be 18 or above.'
        );
    END IF;

    DBMS_OUTPUT.PUT_LINE('Program executed successfully.');

EXCEPTION
    WHEN invalid_marks THEN

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
 ```![output](6b1.png)
![output](6b2.png)
![output](6b3.png)
