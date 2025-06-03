DELIMITER $$

CREATE PROCEDURE ProcessMemberPayment (
    IN p_MemberID INT,
    IN p_Amount DECIMAL(10, 2)
)
BEGIN
    DECLARE exit HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Rollback if anything fails
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Transaction failed. Rolled back.';
    END;

    START TRANSACTION;

    -- Optional: Lock the member row to prevent concurrent changes
    -- This helps ensure consistency in a high-concurrency environment.
    -- SELECT * FROM members WHERE MemberID = p_MemberID FOR UPDATE;

    -- Insert the payment record
    INSERT INTO payments (MemberID, PaymentDate, Amount, PaymentStatus)
    VALUES (p_MemberID, CURRENT_DATE(), p_Amount, 'Paid');

    -- Update the member's details
    UPDATE members
    SET
        LastPaymentDate = CURRENT_DATE(),
        NextPaymentDueDate = DATE_ADD(CURRENT_DATE(), INTERVAL 1 MONTH),
        TotalPaymentsMade = COALESCE(TotalPaymentsMade, 0) + p_Amount,
        MembershipStatus = CASE
            WHEN MembershipStatus IN ('Expired', 'Suspended') THEN 'Active'
            ELSE MembershipStatus
        END
    WHERE MemberID = p_MemberID;

    -- Check if the update affected a row (valid member)
    IF ROW_COUNT() = 0 THEN
        -- Invalid MemberID
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid MemberID. Transaction rolled back.';
    END IF;

    COMMIT;
END$$

DELIMITER ;
