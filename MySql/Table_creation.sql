use revision;

create table Tab1 (
Name varchar(255),
id int,
age int);

create table Name_a as
select * from Tab1 where Name like 'a%'


use rev1;

create  table Table1 (
Name varchar(255),
id int,
age int);


CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    department VARCHAR(50),
    salary DECIMAL(10,2)
);



create table test_constraints(
name varchar(255) not null 
check( name <> '' ));

alter table  test_constraints
add Id int check  (id <> '');

alter table  test_constraints
add unique(Id)
;