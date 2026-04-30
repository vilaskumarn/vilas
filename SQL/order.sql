-- select employee_id,salary,rank()over(order by salary desc) as rank from hr.EMPLOYEES
-- select employee_id,salary,dense_rank()over(order by salary desc) as rank from hr.EMPLOYEES
-- select employee_id,salary,row_number()over(order by salary desc) as rank from hr.EMPLOYEES

-- select employee_id,salary,rank()over(partition by department_id order by salary desc) as rank from hr.EMPLOYEES
-- select employee_id,salary,dense_rank()over(partition by department_id order by salary desc) as rank from hr.EMPLOYEES
-- select employee_id,salary,row_number()over(partition by department_id order by salary desc) as rank from hr.EMPLOYEES

-- select * from hr.DEPARTMENTS

-- select employee_id,department_id,salary,row_number()over(partition by department_id order by salary desc) as rank from hr.EMPLOYEES
-- select employee_id,department_id,salary,rank()over(partition by department_id order by salary desc) as rank from hr.EMPLOYEES
select employee_id,department_id,salary,dense_rank()over(partition by department_id order by salary desc) as rank from hr.EMPLOYEES
