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