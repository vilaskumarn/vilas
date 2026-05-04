-- 1. Employees earning more than average salary

-- select emp_name,salary from EMPLOYEES
-- where salary>(select avg(salary) from Employees);

--2. Second heighest salary

-- select max(salary) from EMPLOYEES
-- where SALARY<(select max(salary) from EMPLOYEES);

-- 3. Employees in IT department

-- select emp_name from EMPLOYEES
-- where DEPT_ID=(select dept_id from DEPARTMENTS
-- where dept_name ='IT');

-- select emp_name from EMPLOYEES
-- where DEPT_ID=(select dept_id from DEPARTMENTS
-- where dept_name ='SALES');

-- 4. Employees with salary greater than HR employees

-- select emp_name from employees where salary>all(select salary from employees where dept_id=10);

-- 5. Employees who are managers

-- select emp_name from EMPLOYEES
-- where EMP_ID in (select manager_id from EMPLOYEES);

-- 6. Departments having more than 5 employees

-- select DEPT_ID from EMPLOYEES
-- GROUP by DEPT_ID
-- HAVING count(*)>1;    -- we will recieve an extra row with null value

-- select DEPT_ID from EMPLOYEES
-- GROUP by DEPT_ID
-- HAVING count(dept_id)>1; -- no null value

-- 7. Employees without department

-- select emp_name from EMPLOYEES
-- WHERE dept_id not in (select dept_id from departments);

-- select emp_name from EMPLOYEES
-- WHERE dept_id in (select dept_id from departments);

-- 8. dept avg salary greater than overall avg salary

-- select dept_id from EMPLOYEES
-- GROUP by DEPT_ID
-- HAVING avg(salary)>(select avg(salary) from EMPLOYEES);

-- select dept_name,dept_id from DEPARTMENTS
-- where dept_id IN(
-- select dept_id from EMPLOYEES
-- GROUP by DEPT_ID
-- HAVING avg(salary)>(select avg(salary) from EMPLOYEES));

-- 9. Dept wise avg salary

-- select dept_id,avg_sal from (
--     select dept_id, avg(salary) avg_sal from EMPLOYEES
--     group by dept_id
-- );

-- 10. Employees greater than dept avg

-- select e.emp_name from EMPLOYEES e
-- join (
--     SELECT dept_id,avg(salary) avg_sal
--     from EMPLOYEES GROUP by dept_id
-- )d on e.dept_id=d.dept_id
-- where e.salary>d.avg_sal;


-- 11. Top 5 Salaries

select * from ( select emp_name,salary from employees
order by salary desc)t 
-- limit 5;