create database sql_joins;
show databases;

use sql_joins;

create table cricket (cricket_id int auto_increment,name varchar(30),primary key(cricket_id));

create table football (football_id int auto_increment,name varchar(30),primary key(football_id));

describe football;

insert into cricket (name)
VALUES ("Thala") , ("ken willimson") , ("brain lara") , ("bumrah") , ("ricky ponting");

select * from cricket;

insert into football (name)
VALUES ("Thala") , ("johnson") , ("bumrah") , ("Langer") , ("Astle");

select * from football;

select c.name as sameNameOfBothField from 
football as f inner join cricket as c
where f.name=c.name  -- -- use where also same as
group by c.name;


show tables;

-- -- if the use of left join these case all the row are left side and match all row show right side
select * from 
football as f left join cricket as c
on f.name = c.name; -- -- use where also same as


-- -- if the use of right join these case all the row are right side and match all row show left side
select * from 
football as f right join cricket as c
on f.name = c.name; 


select * from employees;
select * from sale;
show tables;

select concat(e.emp_name , ' , ' , e.city) as user , concat(s.product_id , ' , ' , s.state) as product
from employees as e inner join sale as s
on e.city = s.state
order by product;


