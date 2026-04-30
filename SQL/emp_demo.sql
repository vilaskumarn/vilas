-- CREATE TABLE emp_demo (
--     emp_id NUMBER,
--     emp_name VARCHAR2(20),
--     dept_id NUMBER,
--     salary NUMBER
-- );

-- INSERT INTO emp_demo VALUES (1, 'A', 10, 5000);
-- INSERT INTO emp_demo VALUES (2, 'B', 10, 6000);
-- INSERT INTO emp_demo VALUES (3, 'C', 10, 7000);
-- INSERT INTO emp_demo VALUES (4, 'D', 20, 4000);
-- INSERT INTO emp_demo VALUES (5, 'E', 20, 4500);
-- INSERT INTO emp_demo VALUES (6, 'F', 20, 5500);

-- select emp_name,dept_id,salary,
-- lag(salary) OVER ( order by emp_id) as next_salary 
-- from emp_demo

-- select emp_name,dept_id,salary,
-- lag(salary,2) OVER (order by emp_id) as next_salary 
-- from emp_demo

-- select emp_name,dept_id,salary,
-- lead(salary) OVER (order by emp_id) as next_salary 
-- from emp_demo

-- select emp_name,dept_id,salary,
-- lead(salary,2) OVER (order by emp_id) as next_salary 
-- from emp_demo












-- select emp_name,dept_id,salary,
-- lag(salary) OVER (partition by dept_id order by emp_id) as next_salary 
-- from emp_demo











-- select emp_name,dept_id,salary,
-- lag(salary,2) OVER (partition by dept_id order by emp_id) as next_salary 
-- from emp_demo

-- select emp_name,dept_id,salary,
-- lead(salary) OVER (partition by dept_id order by emp_id) as next_salary 
-- from emp_demo

-- select emp_name,dept_id,salary,
-- lead(salary,2) OVER (partition by dept_id order by emp_id) as next_salary 
-- from emp_demo