SHOW tables;
SELECT * FROM sale;
# VIEW

CREATE VIEW order_detaile
as 
	SELECT sell_price, quantity, state 
    FROM sale;

SELECT * FROM order_detaile;   -- -- behaviour just like table

# RENAME views

RENAME TABLE order_detaile to orders;

SELECT * FROM orders;

# SHOW TABLE includ VIEW

SHOW FULL TABLES WHERE table_type = 'VIEW';

#DELETE VIEW
DROP VIEW order_detaile;