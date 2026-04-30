-- select nvl(null,'data') from dual                    --It replaces the null with 'data'
-- select nvl(10,10) from dual
-- select salary,nvl(salary,0) from hr.EMPLOYEES        --It replaces the null with 0
-- select nvl2(20,'not null','is null') from dual

-- select nvl2(null,'not null','is null') from dual     --It returns based on null or not
-- select nullif('data','data science') from dual       
-- select nullif('data','data') from dual               --It returns the null if both are same else first item

-- select coalesce(null,null,20,45) from dual           --It returns the first non-null item