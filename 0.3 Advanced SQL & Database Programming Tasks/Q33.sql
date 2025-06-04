-- Q33: User-Defined Function — GetClassAvailability
DELIMITER $$

CREATE FUNCTION GetClassAvailability(p_ClassID INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
  DECLARE result VARCHAR(50);
  DECLARE capacity INT;
  DECLARE current INT;

  SELECT MaxCapacity, CurrentBookings INTO capacity, current
  FROM Classes WHERE ClassID = p_ClassID;

  IF capacity IS NULL THEN
    SET result = 'Class Not Found';
  ELSEIF current >= capacity THEN
    SET result = 'Full';
  ELSE
    SET result = CONCAT('Available (', capacity - current, ' spots left)');
  END IF;

  RETURN result;
END $$

DELIMITER ;

-- Test
SELECT GetClassAvailability(1) AS Availability;