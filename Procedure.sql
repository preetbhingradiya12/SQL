
SHOW tables;

# Store Procedure

SELECT * FROM sale;

-- without parameter
DELIMITER &&
CREATE PROCEDURE top_sale()
BEGIN
	SELECT * FROM sale WHERE quantity >= 10;
END &&
DELIMITER ;

CALL top_sale();	

# SP using in (pass variable)
DELIMITER //
CREATE PROCEDURE sort_salary(IN var INT)
BEGIN 
	SELECT * FROM employees ORDER BY salary DESC LIMIT var;
END //
DELIMITER ;

CALL sort_salary(2);



-- covert both in one procedure
DELIMITER //
CREATE PROCEDURE emp_sale(IN var INT)
BEGIN 
	SELECT * FROM employees ORDER BY salary DESC LIMIT var;
    SELECT * FROM sale WHERE quantity >= 10;
END //
DELIMITER ;



-- -- ---
SELECT * FROM employees;
DELIMITER //
CREATE PROCEDURE employeTheySalaryGraterToavg()
BEGIN
	SELECT * from employees WHERE salary >= (SELECT avg(salary) from employees);
END//
DELIMITER ;

CALL employeTheySalaryGraterToavg();
SELECT avg(salary) as avgSalary from employees;




# Update empolyees use of procedure
SET SQL_SAFE_UPDATES = 0;

DELIMITER //
CREATE PROCEDURE up_salary(IN newage int, newsalary FLOAT)
BEGIN
	UPDATE employees SET salary = newsalary WHERE age = newage;
END //
DELIMITER ;

call up_salary(27, 80000);	

# OUT in procedure OUT keyword return the data in the procedure and give the funcation use of @ character
-- -- here totla emp are store into the emp variable 
DELIMITER //
CREATE PROCEDURE total_emps(OUT emp INT)
BEGIN
	SELECT count(emp_name) INTO emp FROM employees WHERE gender ='M';  
END //
DELIMITER ;

CALL total_emps(@emp);
SELECT @emp AS toal;


#InOUT in procedure INOUT keyword use the pass data in procedure it can modify or whatever return the also this data
DELIMITER //
CREATE PROCEDURE myProcedure(INOUT inOutParam INT)
BEGIN
    SET inOutParam = inOutParam * 2; 
END; //
DELIMITER ;


SET @value = 5; -- Assign a value to  the session variable @value

CALL myProcedure(@value); -- Call the stored procedure with @value as the parameter

SELECT @value; -- Retrieve the modified value of @value
