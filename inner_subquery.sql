select salary from employees order by salary desc limit 1;  -- -- both is same
select salary from employees where salary = (select max(salary) from employees);

select * from employees;
-- -- SELECT QUERY 

SELECT AVG(salary) AS average_salary FROM employees;

select * from employees where salary < (select avg(salary) from employees);

-- -- INSER QUERT
create table selectEmploye (id int , name varchar(20) , age int , gender char(1) , salary int);
show tables;

drop table selectEmploye;

describe selectEmploye;

insert into selectEmploye
select emp_id , emp_name , age , gender , salary from employees
where emp_id in (select emp_id from employees where salary >= 65000 );

select * from selectEmploye;

-- -- UPDATE QUERY

update selectEmploye set age = 100 where salary in 
(select salary from employees where salary >= 7200);

select * from selectEmploye;


-- -- DELETE QUERY

select * from selectEmploye;

delete from selectEmploye where age in 
(select age from selectEmploye where age < 26);

select * from selectEmploye;