-- 1. Creating stored Procedures using transaction control for processMemberPayment
DELIMITER //

CREATE PROCEDURE ProcessMemberPayment (
    IN p_MemberID INT,
    IN p_PaymentAmount DECIMAL(8,2),
    IN p_PaymentDate DATE
)
proc_body: BEGIN
    DECLARE v_CurrentStatus ENUM('Active', 'Expired', 'Suspended');
    DECLARE v_LastPaymentDate DATE;
    DECLARE v_NextPaymentDueDate DATE;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Payment Failed: Transaction rolled back due to error.' AS Message;
    END;

    START TRANSACTION;

    SELECT membership_status, LastPaymentDate, NextPaymentDueDate
    INTO v_CurrentStatus, v_LastPaymentDate, v_NextPaymentDueDate
    FROM members WHERE MemberID = p_MemberID
    FOR UPDATE;

    IF v_CurrentStatus IS NULL THEN
        ROLLBACK;
        SELECT 'Payment Failed: Member Not Found' AS Message;
        LEAVE proc_body;
    END IF;

    INSERT INTO payments (MemberID, PaymentDate, AmountPaid, PaymentStatus)
    VALUES (p_MemberID, p_PaymentDate, p_PaymentAmount, 'Paid');

    SET v_LastPaymentDate = p_PaymentDate;
    SET v_NextPaymentDueDate = DATE_ADD(p_PaymentDate, INTERVAL 1 MONTH);

    UPDATE members
    SET
        LastPaymentDate = v_LastPaymentDate,
        NextPaymentDueDate = v_NextPaymentDueDate,
        TotalPaymentsMade = TotalPaymentsMade + p_PaymentAmount,
        membership_status = CASE 
            WHEN membership_status IN ('Expired', 'Suspended') THEN 'Active'
            ELSE membership_status
        END
    WHERE MemberID = p_MemberID;

    COMMIT;

    SELECT 'Payment Successful' AS Message;
END proc_body;
//

DELIMITER ;
-- calling the stored procedure to ensure it's saved
CALL ProcessMemberPayment(1, 50.00, CURDATE());

-- checking initial member data
SELECT MemberID, membership_status, LastPaymentDate, NextPaymentDueDate, TotalPaymentsMade
FROM members
WHERE MemberID = 1;

-- call the procedure with inital test payment
CALL ProcessMemberPayment(1, 100.00, CURDATE());

-- check updated member data
SELECT MemberID, membership_status, LastPaymentDate, NextPaymentDueDate, TotalPaymentsMade
FROM members
WHERE MemberID = 1;

-- check payment table for inserted record
SELECT * FROM payments WHERE MemberID = 1 ORDER BY PaymentDate DESC LIMIT 1;

-- Testing error handling
CALL ProcessMemberPayment(9999, 50.00, CURDATE());