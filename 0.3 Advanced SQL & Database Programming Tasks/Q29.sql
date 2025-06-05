use evolve_fitness;

STORED PROCEDURE: Process Member Payment
DELIMITER //
CREATE PROCEDURE ProcessMemberPayment(IN p_MemberID INT,
IN p_PaymentAmount DECIMAL(10,2),
IN p_PaymentDate DATE)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
ROLLBACK;
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Payment processing failed. Transaction rolled back.';
END;

START TRANSACTION;

INSERT INTO Payments (MemberID, PaymentDate, Amount, PaymentStatus)
VALUES (p_MemberID, p_PaymentDate, p_PaymentAmount, 'Paid');

UPDATE Members
SET LastPaymentDate = p_PaymentDate,
NextPaymentDueDate = DATE_ADD(p_PaymentDate, INTERVAL 1 MONTH),
TotalPaymentsMade = TotalPaymentsMade + p_PaymentAmount,
MembershipStatus = 'Active'
WHERE MemberID = p_MemberID;

COMMIT;
END //
DELIMITER ;