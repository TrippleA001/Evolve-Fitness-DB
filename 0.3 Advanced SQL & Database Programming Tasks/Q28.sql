use evolve_fitness;
-- 1. STORED PROCEDURE: Register New Member
DELIMITER //
CREATE PROCEDURE RegisterNewMember(IN p_FirstName VARCHAR(50),
IN p_LastName VARCHAR(50),
IN p_DateOfBirth DATE,
IN p_Email VARCHAR(100),
IN p_Phone VARCHAR(20),
IN p_TierID INT,
IN p_RegistrationDate DATE,
IN p_InitialPaymentAmount DECIMAL(10,2))
BEGIN
DECLARE v_MemberID INT;
DECLARE v_Exists INT;

SELECT COUNT(*) INTO v_Exists FROM Members WHERE Email = p_Email;

IF v_Exists > 0 THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Email already registered';
ELSE
INSERT INTO Members (FirstName, LastName, DateOfBirth, Email, Phone, TierID, RegistrationDate, MembershipStatus, LastPaymentDate, NextPaymentDueDate, TotalPaymentsMade)
VALUES (p_FirstName, p_LastName, p_DateOfBirth, p_Email, p_Phone, p_TierID, p_RegistrationDate, 'Active', p_RegistrationDate, DATE_ADD(p_RegistrationDate, INTERVAL 1 MONTH), p_InitialPaymentAmount);

SET v_MemberID = LAST_INSERT_ID();

INSERT INTO Payments (MemberID, PaymentDate, Amount, PaymentStatus)
VALUES (v_MemberID, p_RegistrationDate, p_InitialPaymentAmount, 'Paid');
END IF;
END //
DELIMITER ;
