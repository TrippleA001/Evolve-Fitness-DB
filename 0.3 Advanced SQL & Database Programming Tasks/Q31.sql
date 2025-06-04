-- Q31: User-Defined Function — CalculateMemberAge
DELIMITER $$

CREATE FUNCTION CalculateMemberAge(p_DateOfBirth DATE)
RETURNS INT
DETERMINISTIC
BEGIN
  RETURN TIMESTAMPDIFF(YEAR, p_DateOfBirth, CURDATE());
END $$

DELIMITER ;

-- Test
SELECT CalculateMemberAge('1990-01-15') AS Age;




