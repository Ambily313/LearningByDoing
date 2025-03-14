use revision;

select * from tab1;

select * from Name_a ;

select * from Name_a where age > 20;

select * from tab1 where age > 20
order by age ;

select * from tab1 where age > 20
order by name ;

select * from tab1 where age > 20 and id > 2
order by name desc ;

select * from tab1 where age > 20 and id > 2
order by name desc ,age asc;

select * from tab1 where age > 20 and id > 2
order by  id asc, name desc ;

select * from tab1 where age > 20 and id > 2
order by name, id , age desc ;

use rev1
select * from employees ;


select * from employees
where (age > 30) and (not department='HR')
order by department, age asc;

select * from test_constraints;

use rev1
select * from employees ;

select * from employees 
order by  department,age;

select * from employees 
where name like "a%" and age >20
order by  department,age;

select * from employees 
where salary >40000 and age >30
order by  department,age;

select department, COUNT(DISTINCT id) AS employee_count 
from employees 
group by department
having count(distinct id) > 4
order by department


SELECT department, COUNT(DISTINCT id) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(DISTINCT id) < 13
ORDER BY department;

select * from name_a 



SET SQL_SAFE_UPDATES = 0;

UPDATE name_a
SET Name = 'Amy'
WHERE id = 3;

SET SQL_SAFE_UPDATES = 1;  -- Re-enable safe mode

use employee;

select count(emp_name) as Emp_count from employees
group by department;


select count(emp_name) as Emp_count,department from employees
where  salary > 40000
group by department

select count(emp_name) as Emp_count,department from employees
where  salary > 40000 and age between  20 and 30
group by department;

select count(emp_name) as Emp_count,department from employees
where  salary > 40000 and age between  20 and 30
group by department
having emp_count >11;

select * from employees 
where exists (select emp_name from employees where salary>500000 )


select * from employees 
where exists (select emp_name from employees where salary < 500000 )
