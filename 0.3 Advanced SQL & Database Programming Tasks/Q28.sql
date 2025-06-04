-- Q28: Stored Procedure — RegisterNewMember
-- Task: Add a new member, record payment, return status.
DELIMITER $$

CREATE PROCEDURE RegisterNewMember (
  IN p_FirstName VARCHAR(50),
  IN p_LastName VARCHAR(50),
  IN p_DateOfBirth DATE,
  IN p_Email VARCHAR(100),
  IN p_Phone VARCHAR(20),
  IN p_TierID INT,
  IN p_RegistrationDate DATE,
  IN p_InitialPaymentAmount DECIMAL(10,2)
)
BEGIN
  DECLARE memberExists INT;

  SELECT COUNT(*) INTO memberExists FROM Members WHERE Email = p_Email;

  IF memberExists > 0 THEN
    SELECT 'Registration Failed: Email already exists' AS Status;
  ELSE
    INSERT INTO Members (
      FirstName, LastName, DateOfBirth, Email, Phone, TierID,
      RegistrationDate, MembershipStatus, LastPaymentDate,
      NextPaymentDueDate, TotalPaymentsMade
    )
    VALUES (
      p_FirstName, p_LastName, p_DateOfBirth, p_Email, p_Phone, p_TierID,
      p_RegistrationDate, 'Active', p_RegistrationDate,
      DATE_ADD(p_RegistrationDate, INTERVAL 1 MONTH), p_InitialPaymentAmount
    );

    SET @NewMemberID = LAST_INSERT_ID();

    INSERT INTO Payments (MemberID, PaymentDate, AmountPaid, PaymentStatus)
    VALUES (@NewMemberID, p_RegistrationDate, p_InitialPaymentAmount, 'Paid');

    SELECT 'Registration Successful' AS Status, @NewMemberID AS MemberID;
  END IF;
END $$

DELIMITER ;