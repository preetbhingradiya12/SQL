show databases;
use simple_data;
show tables;

create table employees (Emp_id int primary key , Emp_name varchar(20) , Age int , Gender char(1) , Doj date , Dept varchar(20) , city varchar(20) , salary float);

describe employees;

insert into employees (Emp_id, Emp_name, Age, Gender, Doj, Dept, City, Salary)
VALUES
    (1, 'John Doe', 30, 'M', '2022-01-01', 'HR', 'New York', 50000),
    (2, 'Jane Smith', 25, 'F', '2022-02-15', 'IT', 'San Francisco', 60000),
    (3, 'Michael Johnson', 35, 'M', '2021-12-10', 'Finance', 'Chicago', 70000),
    (4, 'Emily Brown', 28, 'F', '2023-03-20', 'Marketing', 'Los Angeles', 55000),
    (5, 'David Lee', 40, 'M', '2020-11-05', 'Operations', 'Houston', 65000),
    (6, 'Jessica Wilson', 32, 'F', '2023-05-12', 'IT', 'Chicago', 62000),
    (7, 'Daniel Martinez', 29, 'M', '2022-08-30', 'HR', 'Boston', 51000),
    (8, 'Sarah Taylor', 27, 'F', '2021-09-25', 'Finance', 'Philadelphia', 72000),
    (9, 'Christopher Anderson', 33, 'M', '2023-01-18', 'Marketing', 'Dallas', 58000),
    (10, 'Amanda Garcia', 31, 'F', '2020-10-10', 'Operations', 'Atlanta', 67000);
    
select * from employees;

update employees set city = 'Chicago' where Emp_id = 6;

select distinct city from employees;

select avg(salary) as avg_salary from employees;

select dept , avg(salary) as emp_salary from employees group by dept;   -- --here the group of very secter and after that avg find **ex = HR is two time (51000 + 50000)/2 

select count(emp_id) as emp_id, city from employees group by city order by count(emp_id);

select * from employees;

select count(emp_id) as empId ,city from employees group by city having count(emp_id) >= 2;

select dept  , avg(salary) as salary from employees group by dept having salary >= 60000;  -- -- salary is just like behaviour variable so use this direct
-- -- select dept  , avg(salary) as salary from employees group by dept having avg(salary) >= 60000;