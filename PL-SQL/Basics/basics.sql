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
    v_data MY_EMPLOYEE%ROWTYPE;
BEGIN
    SELECT *
    INTO v_data
    FROM MY_EMPLOYEE
    WHERE EMPNO = 102;

    DBMS_OUTPUT.PUT_LINE(v_data.ENAME || ' ' || v_data.SAL);
END;
/

DECLARE
    v_salary NUMBER;
    v_bonus NUMBER;
BEGIN
    v_salary:=30000;
    v_bonus:=v_salary*0.1;
    DBMS_OUTPUT.PUT_LINE(v_salary || ' ' || v_bonus);
END;
/


DECLARE
    v_salary NUMBER :=40000;
BEGIN
    IF v_salary>30000 AND v_salary<50000
    THEN
        DBMS_OUTPUT.PUT_LINE('Salary is in range');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Salary is out of range');
    END IF;
END;
/


DECLARE
    v_deptno NUMBER := 20;
BEGIN
    CASE
        WHEN v_deptno=10 THEN
            DBMS_OUTPUT.PUT_LINE('Accounting');
        WHEN v_deptno=20 THEN 
            DBMS_OUTPUT.PUT_LINE('Research');
        WHEN v_deptno=30 THEN
            DBMS_OUTPUT.PUT_LINE('Sales');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Unknown Department');
        END CASE;
    END;
    /


DECLARE
    --i NUMBER;
BEGIN 
    FOR i IN REVERSE 1..5 LOOP 
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/
