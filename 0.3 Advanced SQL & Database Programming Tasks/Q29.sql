DELIMITER $$

CREATE PROCEDURE ProcessMemberPayment (
  IN p_MemberID INT,
  IN p_PaymentAmount DECIMAL(10,2),
  IN p_PaymentDate DATE
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SELECT 'Payment Failed: Transaction Rolled Back' AS Status;
  END;

  START TRANSACTION;

  -- Record the payment
  INSERT INTO Payments (MemberID, PaymentDate, AmountPaid, PaymentStatus)
  VALUES (p_MemberID, p_PaymentDate, p_PaymentAmount, 'Paid');

  -- Update Member details
  UPDATE Members
  SET 
    LastPaymentDate = p_PaymentDate,
    NextPaymentDueDate = DATE_ADD(p_PaymentDate, INTERVAL 1 MONTH),
    TotalPaymentsMade = TotalPaymentsMade + p_PaymentAmount,
    MembershipStatus = CASE 
                         WHEN MembershipStatus IN ('Expired', 'Suspended') THEN 'Active'
                         ELSE MembershipStatus
                       END
  WHERE MemberID = p_MemberID;

  COMMIT;
  SELECT 'Payment Successful' AS Status;
END $$

DELIMITER ;