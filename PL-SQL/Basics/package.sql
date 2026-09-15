CREATE TABLE MY_EMPLOYEE (
    EMPNO NUMBER(4),
    ENAME VARCHAR2(50),
    DEPTNO NUMBER(2),
    SAL NUMBER(10,2)
);

INSERT INTO MY_EMPLOYEE VALUES (101, 'Rahul', 10, 30000);
INSERT INTO MY_EMPLOYEE VALUES (102, 'Priya', 20, 40000);
INSERT INTO MY_EMPLOYEE VALUES (103, 'Aman', 30, 35000);


CREATE OR REPLACE FUNCTION dept_avg(
    p_deptno NUMBER
)
RETURN NUMBER
IS
    v_avg NUMBER;
BEGIN
    SELECT AVG(SAL)
    INTO v_avg
    FROM MY_EMPLOYEE
    WHERE DEPTNO = p_deptno;

    RETURN v_avg;
END;
/
SELECT dept_avg(20) FROM DUAL;


CREATE OR REPLACE PACKAGE emp_pkg
IS
    PROCEDURE show_emp(p_empno NUMBER);

    FUNCTION annual_salary(p_empno NUMBER)
    RETURN NUMBER;
END emp_pkg;
/


CREATE OR REPLACE PACKAGE BODY emp_pkg
IS

    PROCEDURE show_emp(p_empno NUMBER)
    IS
        v_name MY_EMPLOYEE.ENAME%TYPE;
    BEGIN
        SELECT ENAME
        INTO v_name
        FROM MY_EMPLOYEE
        WHERE EMPNO = p_empno;

        DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
    END show_emp;


    FUNCTION annual_salary(p_empno NUMBER)
    RETURN NUMBER
    IS
        v_sal MY_EMPLOYEE.SAL%TYPE;
    BEGIN
        SELECT SAL
        INTO v_sal
        FROM MY_EMPLOYEE
        WHERE EMPNO = p_empno;

        RETURN v_sal * 12;
    END annual_salary;

END emp_pkg;
/



BEGIN
  emp_pkg.show_emp(101);
END;
/


SELECT emp_pkg.annual_salary(101)
FROM DUAL;
