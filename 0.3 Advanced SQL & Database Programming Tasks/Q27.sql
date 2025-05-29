-- TIER 3
-- Stored Procedure: ProcessMemberPayment
DELIMITER //
CREATE PROCEDURE ProcessMemberPayment(
    IN in_MemberID INT,
    IN in_AmountPaid DECIMAL(10,2),
    IN in_PaymentDate DATE
)
BEGIN
    DECLARE tier_fee DECIMAL(10,2);
    DECLARE member_status VARCHAR(20);
    DECLARE tier_id INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- If any error occurs, rollback the transaction
        ROLLBACK;
    END;

    START TRANSACTION;

    -- Optional: lock the row to prevent race conditions
    -- SELECT * FROM members WHERE MemberID = in_MemberID FOR UPDATE;

    -- Get the member's tier and status
    SELECT MembershipTierID, MembershipStatus INTO tier_id, member_status
    FROM members
    WHERE MemberID = in_MemberID;

    -- Get the tier's fee
    SELECT MonthlyFee INTO tier_fee
    FROM membershiptiers
    WHERE TierID = tier_id;

    -- Optional logic: reject underpayments
    IF in_AmountPaid < tier_fee THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Amount paid is less than the required tier fee';
    END IF;

    -- Step 1: Insert into Payments table
    INSERT INTO payments (MemberID, PaymentDate, AmountPaid, PaymentStatus)
    VALUES (in_MemberID, in_PaymentDate, in_AmountPaid, 'Paid');

    -- Step 2: Update Members table
    UPDATE members
    SET 
        LastPaymentDate = in_PaymentDate,
        NextPaymentDueDate = DATE_ADD(in_PaymentDate, INTERVAL 1 MONTH),
        TotalPaymentsMade = TotalPaymentsMade + in_AmountPaid,
        MembershipStatus = CASE
            WHEN MembershipStatus IN ('Expired', 'Suspended') THEN 'Active'
            ELSE MembershipStatus
        END
    WHERE MemberID = in_MemberID;

    -- Step 3: Commit
    COMMIT;
END //
DELIMITER ;

-- Explanation (Locking Concept):
-- Using SELECT ... FOR UPDATE is useful when you expect multiple users/processes
-- to update the same member's records concurrently. It prevents race conditions
-- by locking the selected row until the transaction completes.

-- Testing Script:
-- 1. Show member's current state
SELECT * FROM members WHERE MemberID = 1;
SELECT * FROM payments WHERE MemberID = 1;

-- 2. Call the procedure
CALL ProcessMemberPayment(1, 50.00, CURDATE());

-- 3. Show updated state
SELECT * FROM members WHERE MemberID = 1;
SELECT * FROM payments WHERE MemberID = 1 ORDER BY PaymentDate DESC;

-- 4. Test failure case (invalid member ID)
CALL ProcessMemberPayment(999, 50.00, CURDATE()); -- Should rollback and do nothing

