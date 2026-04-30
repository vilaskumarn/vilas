/* CTE Hands-on

Syntax:

1:

select cte as ( select operation from table_name);
select * from cte

2:

select cte1 as ( select operation from table_name),select cte2 as ( select operation from table_name or cte1);
select * from cte2

*/




--    1. Company avg → Dept avg → Employees above dept avg
   
-- WITH company_avg AS (
--     SELECT AVG(salary) AS avg_salary
--     FROM hr.employees
-- ),
-- dept_avg AS (
--     SELECT department_id, AVG(salary) AS avg_salary
--     FROM hr.employees
--     GROUP BY department_id
-- ),
-- high_earners AS (
--     SELECT e.employee_id, e.first_name, e.salary, e.department_id
--     FROM hr.employees e
--     JOIN dept_avg d
--       ON e.department_id = d.department_id
--     WHERE e.salary > d.avg_salary
--       AND d.avg_salary > (SELECT avg_salary FROM company_avg)
-- )
-- SELECT * FROM high_earners;



--    2. Dept avg → Rank depts → Top departments → Employees
   
-- WITH dept_avg AS (
--     SELECT department_id, AVG(salary) AS avg_salary
--     FROM hr.employees
--     GROUP BY department_id
-- ),
-- ranked_depts AS (
--     SELECT department_id,
--            avg_salary,
--            DENSE_RANK() OVER (ORDER BY avg_salary DESC) AS rnk
--     FROM dept_avg
-- ),
-- top_depts AS (
--     SELECT department_id
--     FROM ranked_depts
--     WHERE rnk <= 3
-- )
-- SELECT e.employee_id, e.first_name, e.salary, e.department_id
-- FROM hr.employees e
-- JOIN top_depts t
--   ON e.department_id = t.department_id;



--    3. Dept stats → Strong depts → Top earners in dept
   
-- WITH dept_stats AS (
--     SELECT department_id,
--            COUNT(*) AS emp_count,
--            AVG(salary) AS avg_salary
--     FROM hr.employees
--     GROUP BY department_id
-- ),
-- strong_depts AS (
--     SELECT department_id
--     FROM dept_stats
--     WHERE emp_count >= 3
--       AND avg_salary > 8000
-- ),
-- dept_max AS (
--     SELECT department_id, MAX(salary) AS max_salary
--     FROM hr.employees
--     GROUP BY department_id
-- )
-- SELECT e.employee_id, e.first_name, e.salary, e.department_id
-- FROM hr.employees e
-- JOIN strong_depts s
--   ON e.department_id = s.department_id
-- JOIN dept_max m
--   ON e.department_id = m.department_id
-- WHERE e.salary = m.max_salary;



--    4. Company avg → Dept performance → High performing depts
   
-- WITH company_avg AS (
--     SELECT AVG(salary) AS avg_salary
--     FROM hr.employees
-- ),
-- dept_performance AS (
--     SELECT department_id,
--            AVG(salary) AS avg_salary,
--            COUNT(*) AS emp_count
--     FROM hr.employees
--     GROUP BY department_id
-- ),
-- high_perf_depts AS (
--     SELECT department_id
--     FROM dept_performance
--     WHERE avg_salary > (SELECT avg_salary FROM company_avg)
--       AND emp_count >= 3
-- )
-- SELECT e.employee_id,
--        e.first_name,
--        e.salary,
--        e.department_id
-- FROM hr.employees e
-- JOIN high_perf_depts h
--   ON e.department_id = h.department_id
-- WHERE e.salary > (
--     SELECT AVG(salary)
--     FROM hr.employees e2
--     WHERE e2.department_id = e.department_id
-- );



--    5. Company avg → Dept avg → Ranked employees in strong depts
   
-- WITH company_avg AS (
--     SELECT AVG(salary) AS avg_salary
--     FROM hr.employees
-- ),
-- dept_avg AS (
--     SELECT department_id,
--            AVG(salary) AS avg_salary
--     FROM hr.employees
--     GROUP BY department_id
-- ),
-- strong_depts AS (
--     SELECT department_id
--     FROM dept_avg
--     WHERE avg_salary > (SELECT avg_salary FROM company_avg)
-- )
-- SELECT employee_id,
--        first_name,
--        salary,
--        department_id,
--        RANK() OVER (
--            PARTITION BY department_id
--            ORDER BY salary DESC
--        ) AS dept_rank
-- FROM hr.employees
-- WHERE department_id IN (SELECT department_id FROM strong_depts);



--    6. Company avg → Dept avg → Employees above both averages
   
-- WITH company_avg AS (
--     SELECT AVG(salary) AS avg_salary
--     FROM hr.employees
-- ),
-- dept_avg AS (
--     SELECT department_id,
--            AVG(salary) AS avg_salary
--     FROM hr.employees
--     GROUP BY department_id
-- ),
-- qualified_emps AS (
--     SELECT e.employee_id,
--            e.first_name,
--            e.salary,
--            e.department_id
--     FROM hr.employees e
--     JOIN dept_avg d
--       ON e.department_id = d.department_id
--     WHERE e.salary > d.avg_salary
--       AND e.salary > (SELECT avg_salary FROM company_avg)
-- )
-- SELECT * FROM qualified_emps;



--    7. Dept stats → Valid depts → Top earners in each dept
   
-- WITH dept_stats AS (
--     SELECT department_id,
--            COUNT(*) AS emp_count,
--            AVG(salary) AS avg_salary,
--            MAX(salary) AS max_salary
--     FROM hr.employees
--     GROUP BY department_id
-- ),
-- valid_depts AS (
--     SELECT department_id
--     FROM dept_stats
--     WHERE emp_count >= 3
--       AND avg_salary > 7000
-- ),
-- top_earners AS (
--     SELECT e.employee_id,
--            e.first_name,
--            e.salary,
--            e.department_id
--     FROM hr.employees e
--     JOIN valid_depts v
--       ON e.department_id = v.department_id
--     WHERE e.salary = (
--         SELECT MAX(salary)
--         FROM hr.employees e2
--         WHERE e2.department_id = e.department_id
--     )
-- )
-- SELECT * FROM top_earners;