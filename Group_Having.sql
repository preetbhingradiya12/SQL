show databases;
use simple_data;
show tables;

create table sale (product_id int , sell_price float , quantity int , state varchar(20));

describe sale;

insert into sale (product_id, sell_price, quantity, state)
VALUES
    (101, 25.50, 10, 'New York'),
    (102, 15.75, 5, 'California'),
    (103, 50.00, 8, 'Ohio'),
    (104, 35.25, 12, 'Florida'),
    (105, 18.00, 3, 'Illinois'),
    (106, 42.75, 6, 'New York'),
    (107, 30.50, 9, 'Ohio'),
    (108, 20.25, 7, 'Georgia'),
    (109, 55.00, 11, 'New York');
    
select * from sale;

select product_id , sum(sell_price* quantity) as revenue from sale group by product_id;

-- -- join table query like

create table product (product_id int, cost_price float);

describe product;

insert into product 
VALUES 
	   (103 , 260.0),
	   (109 , 230.0);
	
select * from product;

select p.product_id , sum((s.sell_price - p.cost_price) * s.quantity) as profit 
from sale as s  inner join product as p 
where s.product_id = p.product_id	
group by p.product_id;   -- -- having p.product_id=103	
