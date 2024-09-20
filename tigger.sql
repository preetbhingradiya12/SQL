create database triggers;
use triggers;

show tables;

-- -- before inser trigger
create table customers (cust_id int, age int, name varchar(30));

describe customers;

-- -- delimiter   check the if the any insert time age is less to 0 it convert into 0

delimiter //
create trigger age_verify
before insert on customers
for each row
begin
	if new.age < 0 then 
		set new.age = 0;
	end if; 
end;//
delimiter ;

drop trigger age_verify;

insert into customers (cust_id , age , name)
VALUES (101 , 11 , "vinay"),
	   (101 , -6 , "aakash"),
       (101 , 88 , "rahul"),
       (101 , -3 , "pankaj");
       
drop table customers;

select * from customers;
       


-- -- AFTER INSERT TRIGGR

CREATE TABLE customer1 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    bod DATE
);



CREATE TABLE message (
    id INT AUTO_INCREMENT PRIMARY KEY,
    messageId INT,
    message VARCHAR(200) NOT NULL
);

DESCRIBE customer1;
DESCRIBE message;

DELIMITER //
CREATE TRIGGER not_null_check
AFTER INSERT ON customer1
FOR EACH ROW
BEGIN
    IF NEW.bod IS NULL THEN 
        INSERT INTO message (messageId, message)
        VALUES (NEW.id, CONCAT('Hi ', NEW.name, ', please update your birthday.'));
    END IF;
END;//
DELIMITER ;

INSERT INTO customer1 (name, bod)
VALUES ('vedadnt', '1998-11-19'),
       ('saikishor', NULL);

SELECT * FROM customer1;

SELECT * FROM message;

DROP TABLE customer1 , message;


-- -- UPDATE BEFORE trigger
SELECT * FROM selectEmploye;

DELIMITER //
CREATE TRIGGER upd_ages
BEFORE UPDATE ON selectEmploye
FOR EACH ROW 
BEGIN
    IF new.salary <= 65000 THEN
        SET old.age = 100;
    ELSE
        SET old.age = 30;
    END IF;
END //
DELIMITER ;


UPDATE selectEmploye SET salary = 55000 WHERE id = 5;
SELECT * FROM selectEmploye;

DROP TRIGGER upd_ages;



SELECT @@sql_mode;

SET sql_mode = 'YOUR_CURRENT_SQL_MODE,NO_ZERO_IN_DATE,NO_ZERO_DATE';
	
