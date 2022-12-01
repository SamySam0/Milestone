
USE `Kilburnazon`;

#------------------------------------------------------------
#-- procedure that displays all employees whose 
#-- birthday is in the current calendar month
#------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE GetCurrentMonthBirtdayEmployees()
BEGIN
	SELECT * FROM Employees
    WHERE MONTH(dateOfBirth) = MONTH(CURRENT_DATE());
END //
DELIMITER ;
