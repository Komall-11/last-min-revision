CREATE TABLE MY_EMPLOYEE (
    EMPNO NUMBER(4),
    ENAME VARCHAR2(50),
    DEPTNO NUMBER(2),
    SAL NUMBER(10,2)
);

INSERT INTO MY_EMPLOYEE VALUES (101, 'Rahul', 10, 30000);
INSERT INTO MY_EMPLOYEE VALUES (102, 'Priya', 20, 40000);
INSERT INTO MY_EMPLOYEE VALUES (103, 'Aman', 30, 35000);

DECLARE
    v_result NUMBER;
BEGIN
    v_result := 100 / 0;

EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Cannot divide by zero');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Some other error occurred');
END;
/

BEGIN
  INSERT INTO MY_EMPLOYEE
  VALUES (101, 'Another Rahul', 10, 30000);

EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
      DBMS_OUTPUT.PUT_LINE('Employee number already exists');
END;
/



DECLARE
    v_name VARCHAR2(3);
BEGIN
    v_name := 'RAHUL';

    DBMS_OUTPUT.PUT_LINE(v_name);

EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Value error occurred');
END;
/

DECLARE
    v_name MY_EMPLOYEE.ENAME%TYPE;
BEGIN
    SELECT ENAME
    INTO v_name
    FROM MY_EMPLOYEE
    WHERE EMPNO = 999;

    DBMS_OUTPUT.PUT_LINE(v_name);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee does not exist');

    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Multiple employees found');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Some other error occurred');
END;
/



DECLARE
    e_invalid_salary EXCEPTION;
    v_salary NUMBER := -5000;
BEGIN

    IF v_salary < 0 THEN
        RAISE e_invalid_salary;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Salary: ' || v_salary);

EXCEPTION
    WHEN e_invalid_salary THEN
        DBMS_OUTPUT.PUT_LINE('Salary cannot be negative');
END;
/


DECLARE
    e_invalid_age EXCEPTION;
    v_age NUMBER := 15;
BEGIN

    IF v_age < 18 THEN
        RAISE e_invalid_age;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Valid age');

EXCEPTION
    WHEN e_invalid_age THEN
        DBMS_OUTPUT.PUT_LINE('Age must be 18 or above');
END;
/



DECLARE
    v_salary NUMBER := -5000;
BEGIN

    IF v_salary < 0 THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Salary cannot be negative'
        );
    END IF;

END;
/

DECLARE
    CURSOR c1 IS
        SELECT ENAME, SAL
        FROM MY_EMPLOYEE;

    v_name MY_EMPLOYEE.ENAME%TYPE;
    v_sal  MY_EMPLOYEE.SAL%TYPE;

BEGIN
    OPEN c1;

    LOOP
        FETCH c1 INTO v_name, v_sal;

        EXIT WHEN c1%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(v_name || ' ' || v_sal);
    END LOOP;

    CLOSE c1;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);

END;
/
