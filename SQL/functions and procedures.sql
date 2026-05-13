
-- /* =========================================================
--    ORACLE PL/SQL - 20 FUNCTIONS AND 20 PROCEDURES
--    ========================================================= */

-- /* =========================
--    FUNCTIONS
--    ========================= */

-- -- 1. Addition Function
-- CREATE OR REPLACE FUNCTION fn_add(a NUMBER, b NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN a + b;
-- END;
-- /
-- DBMS_OUTPUT.PUT_LINE(fn_add(10,98));

-- BEGIN
--     DBMS_OUTPUT.PUT_LINE(fn_add(10,98));
-- END;
-- /


-- -- 2. Subtraction Function
-- CREATE OR REPLACE FUNCTION fn_subtract(a NUMBER, b NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN a - b;
-- END;
-- /

-- BEGIN
--     DBMS_OUTPUT.PUT_LINE(FN_SUBTRACT(10,98));
-- END;
-- /


-- -- 3. Multiplication Function
-- CREATE OR REPLACE FUNCTION fn_multiply(a NUMBER, b NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN a * b;
-- END;
-- /

-- BEGIN
--     DBMS_OUTPUT.PUT_LINE(FN_MULTIPLY(10,8));
-- END;
-- /

-- -- 4. Division Function
-- CREATE OR REPLACE FUNCTION fn_divide(a NUMBER, b NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN a / b;
-- END;
-- /

-- BEGIN
--     DBMS_OUTPUT.PUT_LINE(FN_DIVIDE(10,98));
-- END;
-- /

-- -- 5. Square Function
-- CREATE OR REPLACE FUNCTION fn_square(a NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN a * a;
-- END;
-- /

-- BEGIN
--     DBMS_OUTPUT.PUT_LINE(fn_square(5));
-- END;
-- /

-- -- 6. Cube Function
-- CREATE OR REPLACE FUNCTION fn_cube(a NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN a * a * a;
-- END;
-- /

-- BEGIN
--     DBMS_OUTPUT.PUT_LINE(fn_cube(8));
-- END;
-- /

-- -- 7. Even or Odd Function
-- CREATE OR REPLACE FUNCTION fn_even_odd(a NUMBER)
-- RETURN VARCHAR2
-- IS
-- BEGIN
--     IF MOD(a,2)=0 THEN
--         RETURN 'EVEN';
--     ELSE
--         RETURN 'ODD';
--     END IF;
-- END;
-- /

-- BEGIN
--     DBMS_OUTPUT.PUT_LINE(fn_even_odd(98));
-- END;
-- /

-- -- 8. Maximum Number Function
-- CREATE OR REPLACE FUNCTION fn_max(a NUMBER, b NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     IF a > b THEN
--         RETURN a;
--     ELSE
--         RETURN b;
--     END IF;
-- END;
-- /

-- BEGIN
--     DBMS_OUTPUT.PUT_LINE(fn_max(10,98));
-- END;
-- /

-- -- 9. Minimum Number Function
-- CREATE OR REPLACE FUNCTION fn_min(a NUMBER, b NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     IF a < b THEN
--         RETURN a;
--     ELSE
--         RETURN b;
--     END IF;
-- END;
-- /

-- BEGIN
--     DBMS_OUTPUT.PUT_LINE(fn_min(10,98));
-- END;
-- /

-- -- 10. Factorial Function
-- CREATE OR REPLACE FUNCTION fn_factorial(n NUMBER)
-- RETURN NUMBER
-- IS
--     fact NUMBER := 1;
-- BEGIN
--     FOR i IN 1..n LOOP
--         fact := fact * i;
--     END LOOP;
--     RETURN fact;
-- END;
-- /

-- BEGIN
--     DBMS_OUTPUT.PUT_LINE(fn_factorial(9));
-- END;
-- /


-- -- 11. String Length Function
-- CREATE OR REPLACE FUNCTION fn_string_length(txt VARCHAR2)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN LENGTH(txt);
-- END;
-- /
-- DECLARE
--     txt VARCHAR2(20):='vilas';
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE(fn_string_length(txt));
-- END;
-- /

-- -- 12. Uppercase Function
-- CREATE OR REPLACE FUNCTION fn_uppercase(txt VARCHAR2)
-- RETURN VARCHAR2
-- IS
-- BEGIN
--     RETURN UPPER(txt);
-- END;
-- /
-- DECLARE
--     txt VARCHAR(20) :='vilas';
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE(fn_uppercase(txt));
-- END;
-- /

-- -- 13. Lowercase Function
-- CREATE OR REPLACE FUNCTION fn_lowercase(txt VARCHAR2)
-- RETURN VARCHAR2
-- IS
-- BEGIN
--     RETURN LOWER(txt);
-- END;
-- /
-- DECLARE
--     txt VARCHAR(20):='VILAS';
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE(fn_lowercase(txt));
-- END;
-- /

-- -- 14. Reverse String Function
-- CREATE OR REPLACE FUNCTION fn_reverse(txt VARCHAR2)
-- RETURN VARCHAR2
-- IS
--     rev_txt VARCHAR2(100):='';
-- BEGIN
--     for i in reverse 1 .. Length(txt) LOOP
--         rev_txt:=rev_txt || substr(txt,i,1);
--     end loop;
--     return rev_txt;

--     -- RETURN REVERSE(txt);
-- END;
-- /

-- DECLARE
--     txt VARCHAR(20):='vilas';
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE(fn_reverse(txt));
-- END;
-- /

-- -- 15. Current Date Function
-- CREATE OR REPLACE FUNCTION fn_current_date
-- RETURN DATE
-- IS
-- BEGIN
--     RETURN SYSDATE;
-- END;
-- /

-- BEGIN
--     DBMS_OUTPUT.PUT_LINE(fn_current_date);
-- END;
-- /

-- -- 16. Age Calculation Function
-- CREATE OR REPLACE FUNCTION fn_age(dob DATE)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN TRUNC(MONTHS_BETWEEN(SYSDATE, dob)/12);
-- END;
-- /

-- BEGIN
--     DBMS_OUTPUT.PUT_LINE(fn_age('08-Apr-2003'));
-- END;
-- /

-- -- 17. Simple Interest Function
-- CREATE OR REPLACE FUNCTION fn_simple_interest(p NUMBER, r NUMBER, t NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN (p*r*t)/100;
-- END;
-- /

-- BEGIN
--     DBMS_OUTPUT.PUT_LINE(fn_simple_interest(1000,9,4));
-- END;
-- /

-- -- 18. Circle Area Function
-- CREATE OR REPLACE FUNCTION fn_circle_area(radius NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN 3.14 * radius * radius;
-- END;
-- /

-- BEGIN
--     DBMS_OUTPUT.PUT_LINE(fn_circle_area(9.8));
-- END;
-- /

-- 19. Palindrome Function
-- CREATE OR REPLACE FUNCTION fn_palindrome(txt VARCHAR2)
-- RETURN VARCHAR2
-- IS
-- BEGIN
--     IF txt = FN_REVERSE(txt) THEN
--         RETURN 'PALINDROME';
--     ELSE
--         RETURN 'NOT PALINDROME';
--     END IF;
-- END;
-- /
-- declare
--     txt VARCHAR2(20) :='racecar';
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE(fn_palindrome(txt));
-- END;
-- /

-- -- 20. Salary Hike Function
-- CREATE OR REPLACE FUNCTION fn_salary_hike(salary NUMBER, percent NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN salary + (salary * percent/100);
-- END;
-- /

-- BEGIN
--     DBMS_OUTPUT.PUT_LINE(fn_salary_hike(10000,10));
-- END;
-- /

-- /* =========================
--    PROCEDURES
--    ========================= */

-- -- 1. Hello Procedure
-- CREATE OR REPLACE PROCEDURE pr_hello
-- IS
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE('HELLO WORLD');
-- END;
-- /

-- begin
--     pr_hello;
-- end;
-- /

-- -- 2. Print Number
-- CREATE OR REPLACE PROCEDURE pr_print_number(n NUMBER)
-- IS
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE('NUMBER: ' || n);
-- END;
-- /

-- begin
--     pr_print_number(8);
-- end;
-- /

-- -- 3. Addition Procedure
-- CREATE OR REPLACE PROCEDURE pr_add(a NUMBER, b NUMBER)
-- IS
--     c NUMBER;
-- BEGIN
--     c := a + b;
--     DBMS_OUTPUT.PUT_LINE('SUM: ' || c);
-- END;
-- /

-- begin
--     pr_add(18,92);
-- end;
-- /

-- -- 4. Subtraction Procedure
-- CREATE OR REPLACE PROCEDURE pr_subtract(a NUMBER, b NUMBER)
-- IS
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE('SUBTRACTION: ' || (a-b));
-- END;
-- /

-- begin
--     pr_subtract(18,92);
-- end;
-- /

-- -- 5. Multiplication Procedure
-- CREATE OR REPLACE PROCEDURE pr_multiply(a NUMBER, b NUMBER)
-- IS
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE('MULTIPLICATION: ' || (a*b));
-- END;
-- /

-- begin
--     pr_multiply(58,3);
-- end;
-- /

-- -- 6. Division Procedure
-- CREATE OR REPLACE PROCEDURE pr_divide(a NUMBER, b NUMBER)
-- IS
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE('DIVISION: ' || (a/b));
-- END;
-- /

-- begin
--     pr_divide(16,4);
-- end;
-- /

-- -- 7. Employee Insert Procedure
-- CREATE OR REPLACE PROCEDURE pr_insert_emp(
--     p_id NUMBER,
--     p_name VARCHAR2,
--     p_salary NUMBER
-- )
-- IS
-- BEGIN
--     INSERT INTO employees(emp_id, emp_name, salary)
--     VALUES(p_id, p_name, p_salary);

--     COMMIT;
-- END;
-- /

-- begin
--     pr_insert_emp(1008,'vilas',198000);
-- end;
-- /

-- -- 8. Employee Update Salary
-- CREATE OR REPLACE PROCEDURE pr_update_salary(
--     p_id NUMBER,
--     p_salary NUMBER
-- )
-- IS
-- BEGIN
--     UPDATE employees
--     SET salary = p_salary
--     WHERE emp_id = p_id;

--     COMMIT;
-- END;
-- /

-- begin
--     pr_update_salary(1008,198000);
-- end;
-- /

-- -- 9. Employee Delete Procedure
-- CREATE OR REPLACE PROCEDURE pr_delete_emp(p_id NUMBER)
-- IS
-- BEGIN
--     DELETE FROM employees
--     WHERE emp_id = p_id;

--     COMMIT;
-- END;
-- /

-- begin
--     pr_delete_emp(1008);
-- end;
-- /

-- -- 10. Print Current Date
-- CREATE OR REPLACE PROCEDURE pr_current_date
-- IS
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE(SYSDATE);
-- END;
-- /

-- begin
--     pr_current_date;
-- end;
-- /

-- -- 11. Even or Odd Procedure
-- CREATE OR REPLACE PROCEDURE pr_even_odd(n NUMBER)
-- IS
-- BEGIN
--     IF MOD(n,2)=0 THEN
--         DBMS_OUTPUT.PUT_LINE('EVEN');
--     ELSE
--         DBMS_OUTPUT.PUT_LINE('ODD');
--     END IF;
-- END;
-- /

-- begin
--     pr_even_odd(9);
-- end;
-- /

-- -- 12. Factorial Procedure
-- CREATE OR REPLACE PROCEDURE pr_factorial(n NUMBER)
-- IS
--     fact NUMBER := 1;
-- BEGIN
--     FOR i IN 1..n LOOP
--         fact := fact * i;
--     END LOOP;

--     DBMS_OUTPUT.PUT_LINE('FACTORIAL: ' || fact);
-- END;
-- /

-- begin
--     pr_factorial(19);
-- end;
-- /

-- -- 13. Loop Numbers Procedure
-- CREATE OR REPLACE PROCEDURE pr_loop_numbers
-- IS
-- BEGIN
--     FOR i IN 1..10 LOOP
--         DBMS_OUTPUT.PUT_LINE(i);
--     END LOOP;
-- END;
-- /

-- begin
--     pr_loop_numbers;
-- end;
-- /

-- 14. Print Employee Count
-- CREATE OR REPLACE PROCEDURE pr_employee_count
-- IS
--     total NUMBER;
-- BEGIN
--     SELECT COUNT(*) INTO total
--     FROM employees;

--     DBMS_OUTPUT.PUT_LINE('TOTAL EMPLOYEES: ' || total);
-- END;
-- /


-- begin
--     pr_employee_count;
-- end;
-- /


-- -- 15. Print Employee Salary
-- CREATE OR REPLACE PROCEDURE pr_employee_salary(p_id NUMBER)
-- IS
--     sal NUMBER;
-- BEGIN
--     SELECT salary INTO sal
--     FROM employees
--     WHERE emp_id = p_id;

--     DBMS_OUTPUT.PUT_LINE('SALARY: ' || sal);
-- END;
-- /

-- begin
--     pr_employee_salary(104);
-- end;
-- /

-- -- 16. String Reverse Procedure
-- CREATE OR REPLACE PROCEDURE pr_reverse(txt VARCHAR2)
-- IS
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE(FN_REVERSE(txt));
-- END;
-- /

-- begin
--     pr_reverse('vilas');
-- end;
-- /

-- -- 17. Uppercase Procedure
-- CREATE OR REPLACE PROCEDURE pr_upper(txt VARCHAR2)
-- IS
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE(UPPER(txt));
-- END;
-- /

-- begin
--     pr_upper('vilas');
-- end;
-- /

-- -- 18. Lowercase Procedure
-- CREATE OR REPLACE PROCEDURE pr_lower(txt VARCHAR2)
-- IS
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE(LOWER(txt));
-- END;
-- /

-- begin
--     pr_lower('VILAS');
-- end;
-- /

-- -- 19. Bonus Calculation Procedure
-- CREATE OR REPLACE PROCEDURE pr_bonus(
--     salary NUMBER,
--     bonus_percent NUMBER
-- )
-- IS
--     bonus NUMBER;
-- BEGIN
--     bonus := salary * bonus_percent / 100;

--     DBMS_OUTPUT.PUT_LINE('BONUS: ' || bonus);
-- END;
-- /

-- begin
--     pr_bonus(10000,25);
-- end;
-- /

-- -- 20. Swap Two Numbers Procedure
-- CREATE OR REPLACE PROCEDURE pr_swap(
--     a IN OUT NUMBER,
--     b IN OUT NUMBER
-- )
-- IS
--     temp NUMBER;
-- BEGIN
--     temp := a;
--     a := b;
--     b := temp;
-- END;
-- /

DECLARE
    a NUMBER := 8;
    b NUMBER := 18;
BEGIN
    pr_swap(a, b);

    DBMS_OUTPUT.PUT_LINE('a = ' || a);
    DBMS_OUTPUT.PUT_LINE('b = ' || b);
END;
/
