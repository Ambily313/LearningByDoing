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

=====================================================================
''' The MySQL CASE Statement
The CASE statement goes through conditions and returns a value when the first condition is met (like an if-then-else statement). So, once a condition is true, it will stop reading and return the result. If no conditions are true, it returns the value in the ELSE clause.

If there is no ELSE part and no conditions are true, it returns NULL.

CASE Syntax
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;
'''
==============================================================================

''' 
In MySQL, IFNULL() and COALESCE() are both functions used to handle NULL values, but they have slight differences in functionality.

1. IFNULL()
IFNULL(expression, replacement_value)
It checks if the first argument (expression) is NULL. If it is NULL, it returns
 the second argument (replacement_value). Otherwise, it returns the first argument.
 
 SELECT IFNULL(NULL, 'Default Value'); -- Returns 'Default Value'
SELECT IFNULL(10, 'Default Value');   -- Returns 10


2. COALESCE()
COALESCE(expression1, expression2, ..., expressionN)
It returns the first non-NULL value from the list of expressions. 
If all expressions are NULL, it returns NULL.

SELECT COALESCE(NULL, NULL, 'First Non-NULL', 'Second Non-NULL'); 
-- Returns 'First Non-NULL'

SELECT COALESCE(NULL, NULL, NULL); 
-- Returns NULL

Advantage: COALESCE() can take multiple arguments, making it more flexible than IFNULL().


Key Differences

Feature	        IFNULL()	                                          COALESCE()
Arguments	Only 2 arguments	                                   Multiple arguments allowed
Functionality	Checks if the first value is NULL, replaces it   	Returns the first non-NULL value from a list
Flexibility	Less flexible	                                       More flexible

When to Use Which?
Use IFNULL() when you only need to check one value and provide a default.
Use COALESCE() when you have multiple possible fallback values.


'''
=======================================================================



